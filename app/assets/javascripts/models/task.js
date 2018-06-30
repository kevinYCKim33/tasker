function Task(data) {
  this.data = data;
}

Task.prototype.createTaskForm = function() {
  return HandlebarsTemplates['edit_task']({
    task: this.data
  });
}
