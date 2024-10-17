import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  addPlayer() {
    try{
      const playerId = document.getElementById('add_player_id').value
      if(playerId == "") return alert('Please enter a player id')
      const gameId = this.element.dataset.gameId
      const groupId = this.element.dataset.groupId
      fetch(`/groups/${groupId}/games/${gameId}/add_player/${playerId}`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
        }
      }).then(response => response)
      .then(data => {
        // Após a criação do item, faça uma requisição Turbo para atualizar a listagem
        Turbo.visit(window.location.href, { action: "replace" });
      })
      .catch(error => console.error('Erro:', error));

    }catch(e){
      console.log(e)
    }
  }

  removePlayer() {
    alert('removePlayer')
    try{
      const playerId = this.element.dataset.playerId
      if(playerId == "") return alert('Please enter a player id')
      const gameId = this.element.dataset.gameId
      const groupId = this.element.dataset.groupId
      fetch(`/groups/${groupId}/games/${gameId}/remove_player/${playerId}`, {
        method: 'DELETE',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
        }
      }).then(response => response)
      .then(data => {
        // Após a criação do item, faça uma requisição Turbo para atualizar a listagem
        Turbo.visit(window.location.href, { action: "replace" });
      })
      .catch(error => console.error('Erro:', error));
    }catch(e){
      console.log(e)
    }
  }

  setPlayerTeam() {
    console.log('setPlayerTeam')
    try{
      const playerId = this.element.dataset.playerId
      if(playerId == "") return alert('Please enter a player id')
      const gameId = this.element.dataset.gameId
      const groupId = this.element.dataset.groupId
      const team = this.element.dataset.team
      fetch(`/groups/${groupId}/games/${gameId}/set_player_team/${playerId}/${team}`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
        }
      }).then(response => response)
      .then(data => {
        // Após a criação do item, faça uma requisição Turbo para atualizar a listagem
        Turbo.visit(window.location.href, { action: "replace" });
      })
      .catch(error => console.error('Erro:', error));

    }catch(e){
      console.log(e)
    }
  }
}