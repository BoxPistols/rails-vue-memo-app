<template>
  <div id="app">
    <div class="memo_lay">
      <h2>Memo API TEST</h2>
      <div class="post_org">
        <div class="post_mol">
          <input class="title" type="text" v-model="title" placeholder="タイトル" />
          <input class="description" type="text" v-model="description" placeholder="投稿内容" />
        </div>
        <div class="post_mol">
          <button class="postMemo" v-on:click="postMemo">
            メモ投稿
          </button>
        </div>
      </div>
      <ul class="memo_org">
        <li v-for="memo in memos" :key="memo" class="memo_mol">
          <div class="memo_title">
            {{ memo.title }}
          </div>
          <div class="memo_description">
            {{ memo.description }}
          </div>
        </li>
      </ul>
      <h3>Debug</h3>
      <code>debug: {{ $data.memos }}</code>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data: function() {
    return {
      // init
      memos: '',
      title: '',
      description: ''
    }
  },
  mounted() {
    // API setting
    this.setMemo()
  },
  methods: {
    // API GET
    setMemo() {
      axios
        .get('/api/memos')
        .then(res => {
          this.memos = res.data
        })
        .catch(err => console.error('err api'))
    },
    // API POST
    postMemo() {
      axios
        .post('/api/memos', {
          title: this.title,
          description: this.description
        })
        .then(res => this.setMemo())
    }
  }
}
</script>

<style lang="scss" scoped>
$bold: 600;
#app {
  display: flex;
  justify-content: center;
  flex-direction: column;
  color: #34393c;
}

.memo {
  &_lay {
    margin: auto;
  }
  &_org {
    overflow-x: auto;
    max-height: 480px;
    display: flex;
    flex-direction: column;
    list-style: none;
    border: 1px solid gray;
    padding: 1.5rem;
  }
  &_mol {
    display: flex;
    font-size: 1.25rem;
    border-bottom: 1px solid #ccc;
    line-height: 2;
  }
  &_title {
    width: 120px;
    overflow-x: auto;
    margin-right: 12px;
    font-weight: $bold;
  }
}

// form
input[type='text'],
button {
  height: 1.8em;
  padding: 4px 8px;
  font-size: 1.5em;
  box-sizing: border-box;
  background-color: white;
  border: 1px solid gray;
  border-radius: 4px;
}

.post {
  &_org {
    display: flex;
    align-items: center;
    justify-content: space-between;
    .postMemo {
      padding: 0 40px;
    }
  }
}

// debug
code {
  background-color: #eee;
  padding: 1.5rem;
  max-width: 800px;
  display: block;
  margin: auto;
}
</style>
