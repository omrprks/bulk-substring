# bulk-substring
> Shell script for bulk substring renaming

## Usage
To rename all files containing "yes" and replace with "no" run:
```sh
$ bulk-substring yes no
```
This will change a directory of files from this:
```sh
syes1   syes2   syes3   syes4   syes5   yes1    yes2    yes3    yes4    yes5
```
To this:
```sh
no1     no2     no3     no4     no5     sno1    sno2    sno3    sno4    sno5
```

## Installation
```sh
$ make install
```
Alternatively without make, you may run the following:
```sh
$ cp bulk-substring.sh /usr/local/bin/bulk-substring
```

## License
[MIT](./LICENSE)
