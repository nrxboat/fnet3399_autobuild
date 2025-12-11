#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
./scripts/feeds update -a
./scripts/feeds install -a
echo 'src-git qmodem https://github.com/FUjr/QModem.git;main' >> feeds.conf.default
echo "src-git fancontrol https://github.com/rockjake/luci-app-fancontrol.git" >> feeds.conf.default
sed -i '/\/etc\/init\.d\/tailscale/d;/\/etc\/config\/tailscale/d;' feeds/packages/net/tailscale/Makefile
git clone https://github.com/asvow/luci-app-tailscale package/luci-app-tailscale
git clone https://github.com/eamonxg/luci-theme-aurora package/luci-theme-aurora
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
