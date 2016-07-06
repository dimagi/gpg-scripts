# gpg-scripts
Scripts for managing gpg keyrings and performing common operations

## make-keyring.sh
The `make-keyring.sh` script reads a list of GPG key short hex codes and creates a GPG keyring from them.
If you have a TSV file with a column for short hex codes such as the following `keys.txt`:

```
Ben	xxxxx@dimagi.com	D71D7FAB
Biyeun	xxxxx@dimagi.com	3FA94BE1
Danny	xxxxx@dimagi.com	2D3E8469
Ethan	xxxxx@dimagi.com	5E115245
Nick	xxxxx@dimagi.com	76E43BF4
Phillip	xxxxx@dimagi.com	1D59872B
Will	xxxxx@dimagi.com	E0B9F57B
Aliza	xxxxx@dimagi.com	1EB34D5D
Cal	xxxxx@dimagi.com	438DB73C
Farid	xxxxx@dimagi.com	5B7DA47E
Noah	xxxxx@dimagi.com	2A77BB34
Giovanni	xxxxx@dimagi.com	35BC1738
Jenny	xxxxx@dimagi.com	EA8EE490
Simon	xxxxx@dimagi.com	6D9DB9F6
Clayton	xxxxx@dimagi.com	BAD9E248
Cory	xxxxx@dimagi.com	B4208CED
Daniel	xxxxx@dimagi.com	46DF28DD
Emord	xxxxx@dimagi.com	2954ED26
Norman	xxxxx@dimagi.com	DBA6342E
Sravan	xxxxx@dimagi.com	E2BC0A3D
Manish	xxxxx@dimagi.com	EBCA4720
```

you can combine with `cut` to create a new keyring `dimagi.gpg` with the following command:

```bash
cut -f3 keys.txt | bash make-keyring.sh ./dimagi.gpg
```
