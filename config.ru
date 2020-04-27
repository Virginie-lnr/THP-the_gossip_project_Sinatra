# elles appellent le bundler et permettent de lire le Gemfile. Ainsi, pas besoin de mettre partout des require 'gem'
require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'controller'
run ApplicationController