# How to Run the Assignment on Ubuntu

## 1. Open Terminal
Open your terminal application.

## 2. Navigate to the Folder
Change directory to where you have the files:
```bash
cd /path/to/OSassign
```

## 3. Compile and Run Each Exercise

**Exercise 1: Basic Fork**
Compile:
```bash
gcc exercise1_process_creation.c -o exercise1_process_creation
```
Run and save output:
```bash
./exercise1_process_creation | tee exercise1_log.txt
```

**Exercise 2: Background Process**
Compile:
```bash
gcc exercise2_background_process.c -o exercise2_background_process
```
Run and save output:
```bash
./exercise2_background_process | tee exercise2_log.txt
```

**Exercise 3: Stop Process**
Compile:
```bash
gcc exercise3_stop_process.c -o exercise3_stop_process
```
Run and save output:
```bash
./exercise3_stop_process | tee exercise3_log.txt
```

**Exercise 4: Pause/Resume**
Compile:
```bash
gcc exercise4_pause_resume.c -o exercise4_pause_resume
```
Run and save output:
```bash
./exercise4_pause_resume | tee exercise4_log.txt
```

**Exercise 5: Linker Demo**
Compile (linking two files):
```bash
gcc exercise5_file1.c exercise5_file2.c -o exercise5_linker_demo
```
Run and save output:
```bash
./exercise5_linker_demo | tee exercise5_log.txt
```

**Exercise 6: Loader Demo**
Compile:
```bash
gcc exercise6_loader_demo.c -o exercise6_loader_demo
```
Run and save output (including ldd):
```bash
./exercise6_loader_demo | tee exercise6_log.txt
ldd exercise6_loader_demo | tee -a exercise6_log.txt
```
