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
    console.log('removePlayer')
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

  sortTeams() {
    try{
      const gameId = this.element.dataset.gameId
      if(gameId == "") return alert('Please enter a player id')
      const groupId = this.element.dataset.groupId
      const team = this.element.dataset.team
      fetch(`/groups/${groupId}/games/${gameId}/sort_teams`, {
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

  copyTeamsToClipboard() {
    let str = ''
    const place = document.getElementById('game-place').innerText
    const date = document.getElementById('game-time').innerText
    
    str += `*Local:* ${place}\n*${date}*\n`
    str += '---------------'

    str += `\n*Time A*\n`;
    document.getElementById('team_a_players_table').querySelectorAll('.player-name').forEach((e, i) => {
      str += `*${i + 1} -* ${e.innerText}\n`;
    })
    str += `\n*Time B*\n`;
    document.getElementById('team_b_players_table').querySelectorAll('.player-name').forEach((e, i) => {
      str += `*${i + 1} -* ${e.innerText}\n`;
    })

    navigator.clipboard.writeText(str)
    console.log(str)
  }
}