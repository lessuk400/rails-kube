[
  [task: 'Wash dishes', done: false],
  [task: 'Make a bed', done: false],
  [task: 'Feed the cat', done: false],
  [task: 'Cook diner', done: true]
].each { |task_params| Task.create(task_params) }