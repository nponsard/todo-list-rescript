%%raw(`import './App.css'`)

open Element

@react.component
let make = () => {
  let (count, setCount) = React.useState(() => 1)
  let (todos, setTodo) = React.useState(() => [])
  let (current, setCurrent) = React.useState(() => "")

  let handleSubmit = e => {
    e->JsxEvent.Form.preventDefault
    if current != "" {
      setCount(count => count + 1)

      setTodo(todo => {
        let id = Belt.Int.toString(count)
        [{id, text: current}]->Belt.Array.concat(todo)
      })
      setCurrent(_ => "")
    }
  }

  <div className="App bg-slate-900 text-slate-50">
    <div className="container mx-auto flex flex-col bg-slate-900">
      <h1 className="text-4xl"> {"Todo List"->React.string} </h1>
      <form onSubmit={handleSubmit}>
        <input
          className="p-3 mx-auto w-full bg-slate-800 rounded shadow-lg space-x-4 my-1"
          onChange={e => setCurrent(ReactEvent.Form.target(e)["value"])}
          value={current}
          placeholder="Add Todo"
        />
      </form>
      <TodoList todos setTodo />
    </div>
  </div>
}
