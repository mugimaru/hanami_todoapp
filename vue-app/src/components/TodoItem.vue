<template>
<li :class="todo.completed ? 'completed' : ''">
  <div class="view">
    <input class="toggle" type="checkbox" v-model="todo.completed">
    <label>{{todo.text}}</label>
    <button class="destroy"></button>
  </div>
  <input class="edit" value="Create a TodoMVC template">
</li>
</template>

<script>

export default {
  name: 'TodoItem',
  data () {
    return {}
  },
  props: {
    todo: {}
  },
  methods: {
  }
}
</script>
