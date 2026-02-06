if ! command -v pia-wg-config &> /dev/null; then
    sudo apt-get update && sudo apt-get install golang-go

    # define go installation location and add to path
    go env -w GOPATH=$HOME/go
    echo "export GOPATH=\$HOME/go" >> ~/.bash_profile
    echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.bash_profile
    source ~/.bash_profile
    go install github.com/kylegrantlucas/pia-wg-config@latest
fi

# Source - https://stackoverflow.com/a/20909045
# Posted by Silas Paul, modified by community. See post 'Timeline' for change history
# Retrieved 2026-02-05, License - CC BY-SA 4.0

export $(grep -v '^#' .env | xargs)
pia-wg-config -r ca_ontario $PIA_USERNAME $PIA_PASSWORD | vpn/wireguard/wg0.conf