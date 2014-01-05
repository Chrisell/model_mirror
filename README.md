# Parsley Rails Form Builder

## About
This gem uses [Parsley-Rails](https://github.com/mekishizufu/parsley-rails) as it's basis for asset pipeline integration and updates for Parsley.js

## Usage
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
