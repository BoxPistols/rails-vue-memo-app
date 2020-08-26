<template>
  <div id="app">
    <!-- <p>{{ $data }}</p> -->
    <div class="memo_lay">
      <h2>Memo API TEST</h2>
      <ul class="memo_org">
        <li v-for="memo in memos" :key="memo" class="memo_mol">
          <div class="memo_title">{{ memo.title }}</div>
          <div class="memo_description">{{ memo.description }}</div>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data: function() {
    return {
      // init
          memos: ''
    }
  },
  mounted() {
    // definition Loading
    this.setMemo()
  },
  methods: {
    setMemo() {
      axios
        .get('/api/memos')
        .then(res => {
          this.memos = res.data
        })
        .catch(err => {
          console.error('err api')
          // FIXME: ↓Local test message for develop, Don't deploy!
          document.write('APIエラー')
        })
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
    // max-width: 800px;
    margin: auto;
  }
  &_org {
    overflow-x: auto;
    max-height: 320px;
    display: flex;
    flex-direction: column;
    padding: 0;
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
</style>
