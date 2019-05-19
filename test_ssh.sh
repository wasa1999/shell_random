#!/usr/local/bin/zsh

echo "where to ssh?"
read where
echo "password"
read pw

if [ "$where" = "cns" ]
then
    echo "yes, $where"
    expect -c {
        set timeout 5
        spawn env LANG=C /usr/bin/ssh -i ~/.ssh/ssh_key ccz00.sfc.keio.ac.jp -l s18111ti
        "passwords" {
            send $pw
            exp_continue
        }
        "\\\$" {
            exit $pw
        }
    }
else
    echo "not registerd..."

fi

