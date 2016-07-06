# gpg-scripts
Scripts for managing gpg keyrings and performing common operations

## make-keyring.sh
The `make-keyring.sh` script reads a list of GPG key short hex codes and creates a GPG keyring from them. (If there is more than one tab-separated "column" in stdin, it'll only process the first "column".)
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
## gpg-all.sh

The `gpg-all.sh` script reads a TSV file with columns representing Name (no spaces), Email, and (Secret) Message with positional command line arguments representing the Keyring to use and Directory name, and it will encrypt each <Message> using the key corresponding to <Email> in <Keyring> and write to the file `<Directory>/<Name>.gpg` and then zip <Directory>.

If you have a TSV file named `multi-message.txt` with the contents below:

```
Ben	xxxxx@dimagi.com	SK4zP7eJjA6J
Biyeun	xxxxx@dimagi.com	ThWahlC4Gq/o
Danny	xxxxx@dimagi.com	ftcYDYcHv09P
Ethan	xxxxx@dimagi.com	JjvkF9zJ0zLM
Nick	xxxxx@dimagi.com	6upVV8KF/S5J
Phillip	xxxxx@dimagi.com	bfv0Vq3mm/I8
Will	xxxxx@dimagi.com	uIcoHU4t/+4o
Aliza	xxxxx@dimagi.com	UyixXuw52O14
Cal	xxxxx@dimagi.com	5mdayY0DcJl9
Farid	xxxxx@dimagi.com	uso4cucyfhgX
Noah	xxxxx@dimagi.com	jwCtfaaNTcOM
Giovanni	xxxxx@dimagi.com	O4H7evqkyzR3
Jenny	xxxxx@dimagi.com	esVLD4uv1Vx/
Simon	xxxxx@dimagi.com	YV+++k5Dv50H
Clayton	xxxxx@dimagi.com	rGjyLX6w08QX
Cory	xxxxx@dimagi.com	f7rSGfgn+d7j
Daniel	xxxxx@dimagi.com	FtZiOCuqZF83
Emord	xxxxx@dimagi.com	N1kxqpoSrKFP
Norman	xxxxx@dimagi.com	fwV7bsisfHGM
Sravan	xxxxx@dimagi.com	XPcgZFRybFeE
Manish	xxxxx@dimagi.com	ROlUnVgFxYa9
```

and a keyring called `dimagi.gpg` in the current directory, then you would run

```
bash gpg-all.sh dimagi.gpg test-roundtrip < multi-message.txt
```

to create a zipfile called test-roundtrip.zip that contained Ben.gpg, Biyeun.gpg, etc. with each secret encrypted for only the recipient's eyes.
