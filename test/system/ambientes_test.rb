require "application_system_test_case"

class AmbientesTest < ApplicationSystemTestCase
  setup do
    @ambiente = ambientes(:one)
  end

  test "visiting the index" do
    visit ambientes_url
    assert_selector "h1", text: "Ambientes"
  end

  test "should create ambiente" do
    visit ambientes_url
    click_on "New ambiente"

    fill_in "Nome", with: @ambiente.nome
    fill_in "Tipo", with: @ambiente.tipo
    click_on "Create Ambiente"

    assert_text "Ambiente was successfully created"
    click_on "Back"
  end

  test "should update Ambiente" do
    visit ambiente_url(@ambiente)
    click_on "Edit this ambiente", match: :first

    fill_in "Nome", with: @ambiente.nome
    fill_in "Tipo", with: @ambiente.tipo
    click_on "Update Ambiente"

    assert_text "Ambiente was successfully updated"
    click_on "Back"
  end

  test "should destroy Ambiente" do
    visit ambiente_url(@ambiente)
    click_on "Destroy this ambiente", match: :first

    assert_text "Ambiente was successfully destroyed"
  end
end
