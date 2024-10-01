apt install git unzip gzip xz-utils curl -y;

cd;

SSH="$HOME/.ssh";
SSH_CONFIG="$HOME/.ssh/config";


cat << 'EOF' > "$SSH_CONFIG";
# SSH Configuration
Host *
    StrictHostKeyChecking no
    UserKnownHostsFile=/dev/null
EOF

echo "$GITHUB_SSH_PRIVATE_KEY" >> "$SSH"/id_ed25519; 

chmod 600 "$SSH"/id_ed25519; 

ssh -i "$SSH"/id_ed25519 -T git@github.com; 

curl -fsSL https://moonrepo.dev/install/proto.sh | bash -s -- --yes; 

source ~/.profile; 

cd /workspace; 

git clone git@github.com:$GITHUB_USER_NAME/$GITHUB_REPOSITORY_NAME.git; 

cd $GITHUB_REPOSITORY_NAME; 

proto install; 

python3 -m venv .venv; 

chmod +x .venv/bin/activate; 

source .venv/bin/activate; 

pip install -r requirements.txt; 