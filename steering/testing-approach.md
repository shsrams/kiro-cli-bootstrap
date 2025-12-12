# Testing Approach

## Test Driven Development (TDD)

- Write tests first and confirm failure
- Then write minimal code to make the failing test pass
- Develop in this order: Tests > Models > Services > Endpoints

## Testing Standards

- Comprehensively cover all functionality
- Make sure that all tests pass - accept responsibility for failed tests
- Do not write tests that test mocked behavior - alert if you see one
- Do not implement mocks in integration tests - use real interfaces for testing

## Test Quality

- Tests must verify actual behavior, not mocked responses
- Integration tests should use real interfaces
- All functionality must be covered
- Failed tests are a blocking issue that must be resolved
