# Salt

## Steps to test

* Create Master and Minion keys
* Vagrant up!

## Create Master and Minion keys

### Master

```shell
sudo salt-key --gen-keys-dir=./vagrant/pki --gen-keys=master
sudo chown ${USER} ./vagrant/pki/master*
```

### Minion on Master

```shell
sudo salt-key --gen-keys-dir=./vagrant/pki --gen-keys=master-minion
sudo chown ${USER} ./vagrant/pki/master-minion*
```


### Minion

```shell
sudo salt-key --gen-keys-dir=./vagrant/pki --gen-keys=minion
sudo chown ${USER} ./vagrant/pki/minion*
```

## Vagrant up

```shell
vagrant up
```
