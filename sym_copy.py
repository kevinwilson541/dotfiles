import os
import shutil
import functools

is_dir = lambda f: os.path.isdir(f)
dir_path = lambda d, f: d + "/" + f
is_sym = lambda f: os.path.islink(f)
# symlink files of form "file_name" + ".cp"
new_name = lambda f: (f, f[0: len(f)-3])

# remove .git directory
dirs = os.listdir(".")
dirs.remove(".git")
dirs = filter(is_dir, dirs)
# for each directory, list sym links and copy to similarly named file
for d in dirs:
    # list dirs
    files = map(functools.partial(dir_path, d), os.listdir(d))
    # only use symbolically linked files
    sym_files = filter(is_sym, files)
    # map new names of files
    n_files = map(new_name, sym_files)
    # copy files
    [shutil.copyfile(f[0], f[1]) for f in n_files]
