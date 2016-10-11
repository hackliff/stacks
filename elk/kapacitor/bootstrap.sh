#! /usr/bin/env bash


install_kapacitor () {
  local kapacitor_version="$1"

  yum install -y wget
  wget "https://dl.influxdata.com/kapacitor/releases/kapacitor-${kapacitor_version}.rpm"
  yum localinstall -y kapacitor-${kapacitor_version}.rpm
}

install_kapacitor "1.0.2.x86_64"
