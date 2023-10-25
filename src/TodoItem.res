@react.component
let make = (~el: Element.element, ~onChange: string => unit, ~onDelete: unit => unit) =>
  <div className="flex flex-row w-full bg-slate-800">
    <input
      className=" w-full p-3 mx-auto bg-slate-800 rounded space-x-4 my-1"
      key={el.id}
      value={el.text}
      onChange={e => onChange(ReactEvent.Form.target(e)["value"])}
    />
    <span onClick={_ => onDelete()} className="p-3 cursor-pointer" title="Delete">
      {"x"->React.string}
    </span>
  </div>
