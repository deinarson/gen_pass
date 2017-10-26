# Gen_Pass PoC

In this example we generate a password of rand(12-20) characters, create a sha512 hash and base64 encode that.  We can then take the base64 and pipe it in to a cli to update root pw, never having hit disk `(assuming we are using password-store or vim-gpg)`.


## The Process

    # 0. Clone the repo
    git clone https://github.com/deinarson/gen_pass
    cd gen_pass

    # 1. Build the image:
    make

    # 2. Start haveged
    make entropy

    # 3. Crete a password
    make pass

### Example

    docker run -i -t --rm reponame/infra/gen_pass:latest /pwtools/format.sh

    Date          :  Thu Oct 26 17:26:30 UTC 2017
    Password      :  sheeg.er,uxee4paiZ0
    SHA512 hash   :  $5$Ip4RB1NIPNNl1B8R$jPG9ZHiRw1KSMpzOvP/ITy/nwrfpeWpGJ2dws0lWMj9
    Base64 SHA512 :  JDUkSXA0UkIxTklQTk5sMUI4UiRqUEc5WkhpUncxS1NNcHpPdlAvSVR5L253cmZwZVdwR0oyZHdzMGxXTWo5Cg==

    # Using the Base64 SHA512 ( shortened for this doc)
    usermod -p $(echo 'JDUkSXA0UkIx... ...==' | base64 -d ) root

### Option Using  with VIM
Open a gpg encrypted file password file (with gpg.vim or pass), find the location you want to append to and execute the password generator with the following.

    <esc>:r ! docker run -i -t --rm reponame/gen_pass:latest /gen_pass.sh

