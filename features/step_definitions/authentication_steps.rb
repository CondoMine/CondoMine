# features/step_definitions/authentication_steps.rb

Given("Eu estou logado como um usuario") do
  @user = create_user("example@example.com", "password")
  sign_in("example@example.com", "password")
end
