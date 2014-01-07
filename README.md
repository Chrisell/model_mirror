# Model Mirror

## About
Model Mirror aims at removing front-end and back-end duplication. It uses the validation from your model in order to generate the necessary html attributes on your inputs for your front-end validation framework.

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
