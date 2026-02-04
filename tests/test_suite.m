% Load the solution of the student from the root folder
addpath("..")
addpath(".")

test_input = csvread("test_input.csv");
test_output = csvread("test_output.csv");

% Use Octave's assert to mimic pytest assertions
try
    for i=1:length(test_input)
      assert(myfunc(test_input(i,:)) == test_output(i,:))
    endfor
    disp('TEST_PASSED');
    exit(0);
catch ME
    fprintf(stderr(), "\n--- TEST FAILURE ---\n");
    fprintf(stderr(), "Message: %s\n", ME.message);
    fprintf(stderr(), "Location: %s (Line %d)\n", ME.stack(1).name, ME.stack(1).line);
    fprintf(stderr(), "--------------------\n");
    disp('TEST_FAILED');
    exit(1); % Exit with error code so GitHub sees the failure
end
