open Element

@react.component
let make = (
  ~todos: array<Element.element>,
  ~setTodo: (array<Element.element> => array<Element.element>) => unit,
) => {
  let handleChange = (newText, id) => {
    setTodo(todo => {
      let newTodo = Belt.Array.map(todo, el => {
        if el.id == id {
          {id: el.id, text: newText}
        } else {
          el
        }
      })
      newTodo
    })
  }
  let handleDelete = id => {
    setTodo(todo => {
      let newTodo = Belt.Array.keep(todo, el => el.id != id)
      newTodo
    })
  }

  React.array(
    Belt.Array.map(todos, el => {
      <TodoItem
        el onChange={newText => handleChange(newText, el.id)} onDelete={() => handleDelete(el.id)}
      />
    }),
  )
}
