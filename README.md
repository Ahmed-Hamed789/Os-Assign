# CSE233 Lab 5 - Process Management


## About

This is an assignment for CSE233 Operating Systems course. It contains C programs demonstrating process creation and management using fork() system call, plus examples showing the roles of the linker and loader.


## Requirements

- GCC compiler
- Make utility
- Linux/Unix system or WSL (Windows Subsystem for Linux)

## How to Compile

```bash
make all
```

## How to Run

```bash
# Run all lab exercises
make run-exercises

# Run individual exercise
./exercise1_process_creation
./exercise2_background_process
./exercise3_stop_process
./exercise4_pause_resume
./exercise5_linker_demo
./exercise6_loader_demo
```

## How to Clean

```bash
make clean
```

## Files

### Lab Exercises
- `exercise1_process_creation.c` - Basic fork() example
- `exercise2_background_process.c` - Background process management
- `exercise3_stop_process.c` - Stopping processes with signals
- `exercise4_pause_resume.c` - Pausing and resuming processes
- `exercise5_file1.c` and `exercise5_file2.c` - Linker demonstration
- `exercise6_loader_demo.c` - Loader demonstration


### Documentation
- `explanations.txt` - Detailed explanations of all exercises
- `Makefile` - Build automation
- `LICENSE` - MIT License


## Notes

- All programs must be run on Linux or WSL
- See `explanations.txt` for detailed explanations
- See `INSTRUCTIONS.txt` for setup instructions

## License

MIT License - see LICENSE file

