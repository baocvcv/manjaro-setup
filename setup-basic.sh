su
# setup mirrors, aur & update
pacman-mirrors -c China -i
pacman -Syyu

# setup aur
echo "[archlinuxcn]
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/\$arch" >> /etc/pacman.conf
pacman -Sy
pacman -S archlinuxcn-keyring

# install some stuff
pacman -S --needed v2ray zsh visutal-studio-code-insiders chromium git yay
pacman -S --needed fcitx fcitx-im fcitx-configtool fcitx-sogoupinyin

# setup v2ray
curl https://file.aboringanduselesswebsite.com/s/ETFi2ZJwAqPYE84/download -o /etc/v2ray/config.json
ntpd -qg # sync clock with the network
systemctl start v2ray
systemctl enable v2ray
exit # back to normal user
cd ~

# setup proxy
export ALL_PROXY="http://127.0.0.1:10809"
export all_proxy="http://127.0.0.1:10809"
export http_proxy="http://127.0.0.1:10809"
export https_proxy="http://127.0.0.1:10809"

# setup python
mkdir -p ~/.pip
echo "[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple" >> ~/.pip/pip.conf
pip install --user virtualenv virtualenvwrapper

# setup zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -o .zshrc https://file.aboringanduselesswebsite.com/s/46E4RonaLLRGB8Z/download
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
source .zshrc

# setup fcitx
echo "export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=\"@im=fcitx\"" >> ~/.xprofile

# setup vim
curl -o .vimrc https://raw.githubusercontent.com/amix/vimrc/master/vimrcs/basic.vim
mkdir -p Apps
cd Apps
git clone https://github.com/vim/vim.git
cd vim
curl -o install.sh https://file.aboringanduselesswebsite.com/s/AyFAj3bQy6A7kWH/download
echo "Run install.sh to install vim!!"

# unset proxy
unset ALL_PROXY
unset all_proxy
unset http_proxy
unset https_proxy
