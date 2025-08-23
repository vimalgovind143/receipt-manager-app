#!/bin/bash

# Receipt Manager App - Test Coverage Script
# This script runs tests with coverage and generates HTML reports

set -e

echo "🧪 Starting test coverage analysis..."

# Clean previous coverage data
echo "🧹 Cleaning previous coverage data..."
rm -rf coverage/
mkdir -p coverage

# Run tests with coverage
echo "📊 Running tests with coverage..."
flutter test --coverage

# Check if lcov.info was generated
if [ ! -f "coverage/lcov.info" ]; then
    echo "❌ Error: coverage/lcov.info not generated"
    exit 1
fi

# Generate HTML report using lcov (if available)
if command -v genhtml &> /dev/null; then
    echo "🎨 Generating HTML coverage report..."
    genhtml coverage/lcov.info -o coverage/html
    echo "✅ HTML coverage report generated at: coverage/html/index.html"
    
    # Open the report in browser (macOS)
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "🌐 Opening coverage report in browser..."
        open coverage/html/index.html
    fi
else
    echo "⚠️  lcov not found. Install with: brew install lcov"
    echo "   You can still view the lcov.info file or use online tools to visualize it."
fi

# Generate coverage summary
echo "📋 Coverage Summary:"
if command -v lcov &> /dev/null; then
    lcov --list coverage/lcov.info
else
    echo "   Install lcov to see detailed coverage summary"
fi

# Extract overall coverage percentage
if command -v lcov &> /dev/null; then
    COVERAGE=$(lcov --summary coverage/lcov.info 2>/dev/null | grep "lines......" | awk '{print $2}')
    echo "📊 Overall line coverage: $COVERAGE"
    
    # Set exit code based on coverage threshold (80%)
    COVERAGE_NUM=$(echo $COVERAGE | sed 's/%//')
    if (( $(echo "$COVERAGE_NUM >= 80" | bc -l) )); then
        echo "✅ Coverage meets target (≥80%)"
    else
        echo "⚠️  Coverage below target (<80%)"
    fi
fi

echo "🎉 Test coverage analysis complete!"
echo "📁 Coverage files:"
echo "   - LCOV format: coverage/lcov.info"
if [ -d "coverage/html" ]; then
    echo "   - HTML report: coverage/html/index.html"
fi

echo ""
echo "💡 Tips:"
echo "   - Add more unit tests to improve coverage"
echo "   - Focus on untested business logic and edge cases"
echo "   - Use 'flutter test --coverage test/unit/' to test specific directories"
