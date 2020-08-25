<template>
<div id="app">
  <p>{{ message }}</p>
  <!-- <p>{{ $data }}</p> -->
  <ul>
    <li v-for="memo in memos" :key="memo">
      {{ memo.title }} :
      {{ memo.description }}
    </li>
  </ul>
</div>
</template>

<script>
import axios from 'axios'

export default {
  data: function () {
    return {
      message: "Hello Vue!",
      memos: ''
    }
  },
  mounted() {
    this.setMemo()
  },
  methods: {
    setMemo: function () {
      axios.get('/api/memos')
        .then(res => {
          this.memos = res.data
        })
        .catch(err => {
          console.error("err");
        })
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
