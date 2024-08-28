require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  setup do
    @game = games(:one)
  end

  test "visiting the index" do
    visit games_url
    assert_selector "h1", text: "games"
  end

  test "should create game" do
    visit games_url
    click_on "New game"

    fill_in "Date", with: @game.date
    fill_in "Group", with: @game.group_id
    fill_in "Notes", with: @game.notes
    fill_in "Place", with: @game.place_id
    fill_in "Team1 score", with: @game.team1_score
    fill_in "Team2 score", with: @game.team2_score
    fill_in "Winner", with: @game.winner
    click_on "Create game"

    assert_text "game was successfully created"
    click_on "Back"
  end

  test "should update game" do
    visit game_url(@game)
    click_on "Edit this game", game: :first

    fill_in "Date", with: @game.date
    fill_in "Group", with: @game.group_id
    fill_in "Notes", with: @game.notes
    fill_in "Place", with: @game.place_id
    fill_in "Team1 score", with: @game.team1_score
    fill_in "Team2 score", with: @game.team2_score
    fill_in "Winner", with: @game.winner
    click_on "Update game"

    assert_text "game was successfully updated"
    click_on "Back"
  end

  test "should destroy game" do
    visit game_url(@game)
    click_on "Destroy this game", game: :first

    assert_text "game was successfully destroyed"
  end
end
