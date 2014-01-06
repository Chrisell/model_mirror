# Parsley Rails Form Builder

## About
This gem uses [Parsley-Rails](https://github.com/mekishizufu/parsley-rails) as it's basis for asset pipeline integration and updates for Parsley.js

## Usage

To install, run the following in your terminal:
    rails g model_mirror:install
This will create a model_mirror.rb file in your config/initializers directory. You can modify this file to change your validation attributes for different ActiveModel::Validatior subclasses.

Add validations in your model as usual. Implement the form by using:

*erb:*

    <%= validation_form_for @user do |f| %>
      <%= f.text_field :name %>
      <%= f.password_field :password, skip_validations: true %>
    <% end %>
*haml:*

    = validation_form_for @user do |f|
      = f.text_field :name
      = f.password_field :password, skip_validations: true
