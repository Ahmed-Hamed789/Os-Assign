# Makefile for CSE233 Lab 5 - Process Management
# Alamein University - Faculty of Computer Science & Engineering
# This makefile compiles all lab exercises and additional examples

# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -g
LDFLAGS =

# Lab Exercise executables (from official lab sheet)
LAB_EXERCISES = exercise1_process_creation \
                exercise2_background_process \
                exercise3_stop_process \
                exercise4_pause_resume \
                exercise5_linker_demo \
                exercise6_loader_demo

# Additional example executables
ADDITIONAL_EXAMPLES = example1_basic_fork \
                      example2_fork_with_wait \
                      example3_multiple_forks \
                      example4_fork_exec \
                      example5_process_tree

# All targets
TARGETS = $(LAB_EXERCISES) $(ADDITIONAL_EXAMPLES)

# Default target - build all
all: $(TARGETS)
	@echo ""
	@echo "✓ All exercises and examples compiled successfully!"
	@echo ""

# Lab Exercise targets
exercise1_process_creation: exercise1_process_creation.c
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)

exercise2_background_process: exercise2_background_process.c
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)

exercise3_stop_process: exercise3_stop_process.c
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)

exercise4_pause_resume: exercise4_pause_resume.c
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)

# Exercise 5 - Linker demonstration (combines two files)
exercise5_linker_demo: exercise5_file1.c exercise5_file2.c
	@echo "Compiling file1.c..."
	$(CC) $(CFLAGS) -c exercise5_file1.c -o exercise5_file1.o
	@echo "Compiling file2.c..."
	$(CC) $(CFLAGS) -c exercise5_file2.c -o exercise5_file2.o
	@echo "Linking object files..."
	$(CC) exercise5_file1.o exercise5_file2.o -o $@ $(LDFLAGS)
	@echo "✓ Linker demo compiled successfully"

exercise6_loader_demo: exercise6_loader_demo.c
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)

# Additional example targets
example1_basic_fork: example1_basic_fork.c
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)

example2_fork_with_wait: example2_fork_with_wait.c
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)

example3_multiple_forks: example3_multiple_forks.c
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)

example4_fork_exec: example4_fork_exec.c
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)

example5_process_tree: example5_process_tree.c
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)

# Run lab exercises
run-exercises: $(LAB_EXERCISES)
	@echo ""
	@echo "========================================="
	@echo "   Running Lab Exercises"
	@echo "========================================="
	@echo ""
	@echo "=== Exercise 1: Process Creation ==="
	./exercise1_process_creation
	@echo ""
	@echo "=== Exercise 2: Background Process ==="
	./exercise2_background_process
	@echo ""
	@echo "=== Exercise 3: Stop Process ==="
	./exercise3_stop_process
	@echo ""
	@echo "=== Exercise 4: Pause and Resume ==="
	./exercise4_pause_resume
	@echo ""
	@echo "=== Exercise 5: Linker Demo ==="
	./exercise5_linker_demo
	@echo ""
	@echo "=== Exercise 6: Loader Demo ==="
	@echo "Running program..."
	./exercise6_loader_demo
	@echo "Dynamic libraries used by this program:"
	ldd exercise6_loader_demo || echo "ldd not available (use Linux/WSL)"
	@echo ""

# Run additional examples
run-examples: $(ADDITIONAL_EXAMPLES)
	@echo ""
	@echo "========================================="
	@echo "   Running Additional Examples"
	@echo "========================================="
	@echo ""
	@echo "=== Example 1: Basic Fork ==="
	./example1_basic_fork
	@echo ""
	@echo "=== Example 2: Fork with Wait ==="
	./example2_fork_with_wait
	@echo ""
	@echo "=== Example 3: Multiple Forks ==="
	./example3_multiple_forks
	@echo ""
	@echo "=== Example 4: Fork with Exec ==="
	./example4_fork_exec
	@echo ""
	@echo "=== Example 5: Process Tree ==="
	./example5_process_tree
	@echo ""

# Run everything
run: run-exercises run-examples

# Clean build artifacts
clean:
	rm -f $(TARGETS)
	rm -f *.o
	@echo "✓ Cleaned all build artifacts"

# Clean and rebuild
rebuild: clean all

# Show linker process for Exercise 5
show-linker: exercise5_file1.c exercise5_file2.c
	@echo "=== Demonstrating Linker Process ==="
	@echo ""
	@echo "Step 1: Compile file1.c to object file"
	gcc $(CFLAGS) -c exercise5_file1.c -o exercise5_file1.o
	@echo "✓ Created exercise5_file1.o"
	@echo ""
	@echo "Step 2: Compile file2.c to object file"
	gcc $(CFLAGS) -c exercise5_file2.c -o exercise5_file2.o
	@echo "✓ Created exercise5_file2.o"
	@echo ""
	@echo "Step 3: Link object files together"
	gcc exercise5_file1.o exercise5_file2.o -o exercise5_linker_demo
	@echo "✓ Created executable: exercise5_linker_demo"
	@echo ""
	@echo "The linker resolved the hello() function reference!"
	@echo ""

# Show loader information for Exercise 6
show-loader: exercise6_loader_demo
	@echo "=== Demonstrating Loader Process ==="
	@echo ""
	@echo "Executable: exercise6_loader_demo"
	@echo ""
	@echo "Dynamic libraries that will be loaded at runtime:"
	ldd exercise6_loader_demo || echo "Note: ldd requires Linux/WSL environment"
	@echo ""

# Help target
help:
	@echo "CSE233 Lab 5 - Makefile Help"
	@echo "=============================="
	@echo ""
	@echo "Main targets:"
	@echo "  all             - Build all exercises and examples (default)"
	@echo "  run             - Build and run everything"
	@echo "  run-exercises   - Run only lab exercises"
	@echo "  run-examples    - Run only additional examples"
	@echo "  clean           - Remove all executables and object files"
	@echo "  rebuild         - Clean and rebuild everything"
	@echo "  show-linker     - Demonstrate linker process step-by-step"
	@echo "  show-loader     - Show dynamic libraries (ldd)"
	@echo "  help            - Show this help message"
	@echo ""
	@echo "Lab Exercises (from official lab sheet):"
	@echo "  exercise1_process_creation"
	@echo "  exercise2_background_process"
	@echo "  exercise3_stop_process"
	@echo "  exercise4_pause_resume"
	@echo "  exercise5_linker_demo"
	@echo "  exercise6_loader_demo"
	@echo ""
	@echo "Additional Examples:"
	@echo "  example1_basic_fork"
	@echo "  example2_fork_with_wait"
	@echo "  example3_multiple_forks"
	@echo "  example4_fork_exec"
	@echo "  example5_process_tree"
	@echo ""

# Phony targets
.PHONY: all run run-exercises run-examples clean rebuild show-linker show-loader help
