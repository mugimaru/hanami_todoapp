<template>
<li :class="{ completed: todo.completed, editing: edit }" @dblclick="startEdit">
  <div class="view">
    <input class="toggle" type="checkbox" v-model="todo.completed">
    <label>{{todo.text}}</label>
    <button class="destroy" @click="$emit('delete')"></button>
  </div>
  <input class="edit" v-todo-focus="edit" v-model="editText" @blur="doneEdit" @keyup.enter="doneEdit" @keyup.esc="cancelEdit">
</li>
</template>

<script>

export default {
  name: 'TodoItem',
  data () {
    return {
      edit: false,
      editText: ''
    }
  },
  props: {
    todo: {}
  },
  methods: {
    startEdit () {
      this.editText = this.todo.text
      this.edit = true
    },
    doneEdit () {
      this.todo.text = this.editText
      this.edit = false
      this.editText = ''
      this.$emit('done-edit')
    },
    cancelEdit () {
      this.edit = false
      this.editText = ''
    }
  },
  directives: {
    'todo-focus': function (el, binding) {
      if (binding.value) {
        el.focus()
      }
    }
  }
}
</script>
