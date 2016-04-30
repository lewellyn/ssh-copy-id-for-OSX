# ssh-copy-id for OS X

> Quick port of the useful Unix utility `ssh-copy-id`

## Installation

Git clone & run install script

OR

`curl -L https://raw.githubusercontent.com/lewellyn/ssh-copy-id-for-OSX/master/install.sh | sh`

### Install usage

#### Usage:

`install.sh [-u | -h | -o | -s]`

#### Options:

* `-u`	Install into /usr/local/bin **(DEFAULT)**
* `-h`	Install into $HOME/bin
* `-o`	Install into /opt/local/bin
* `-s`	Install into /usr/bin

## SSH-COPY-ID [man][man]

### NAME
`ssh-copy-id` - install your identity.pub in a remote machine's authorized_keys

### SYNOPSIS

`ssh-copy-id [-i [identity_file]] [-p port] [user@]machine`

#### DESCRIPTION

**ssh-copy-id** is a script that uses ssh to log into a remote
machine (presumably using a login password, so password authentication
should be enabled, unless you've done some clever use of multiple
identities)

It also changes the permissions of the remote user's home, `~/.ssh`,
and `~/.ssh/authorized_keys` to remove group writability (which
would otherwise prevent you from logging in, if the remote `sshd`
has StrictModes set in its configuration).

The `-p port` option allows one to set the port the remote sshd is
listening on.

If the `-i` option is given then the identity file (defaults to
`~/.ssh/identity.pub`) is used, regardless of whether there are any
keys in your ssh-agent.  Otherwise, if this:

`ssh-add -L`

provides any output, it uses that in preference to the identity file.

If the `-i` option is used, or the ssh-add produced no output, then
it uses the contents of the identity file. Once it has one or more
fingerprints (by whatever means) it uses ssh to append them to
`~/.ssh/authorized_keys` on the remote machine (creating the file,
and directory, if necessary)

Note that this can be used to ensure that the keys copied have the
comment one prefers and/or extra options applied, by ensuring that
the key file has these set as preferred before the copy is attempted.

Rather than specifying these as command line options, it is often better to use (per-host) settings in `ssh(1)`'s configuration file: `ssh_config(5)`.

__SEE ALSO__

`ssh(1)`, `ssh-agent(1)`, `sshd(8)`

[man]: https://www.mankier.com/1/ssh-copy-id
