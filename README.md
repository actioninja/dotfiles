# dotfiles

My personal dotfiles

# Setup

This is just so I always remember what needs to happen on a fresh install

## Windows

Enable remote PSH scripts:

```
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Install scoop

```
irm get.scoop.sh | iex
```

Install Git

```
scoop install git
```

Add Personal Scoop Bucket
```
scoop bucket add actioninja-bucket https://github.com/actioninja/scoop-bucket.git
```

Install Comtrya
```
scoop install comtrya
```

Clone Respository
```
git clone https://github.com/actioninja/dotfiles.git ~/.dotfiles
```

Run Comtrya
```
cd ~/.dotfiles
comtrya apply
```
