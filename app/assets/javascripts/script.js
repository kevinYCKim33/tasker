$( document ).on('turbolinks:load',function() {
  editTask();
});

function editTask() {
  $(".edit-task").on('click', function() {
    $('#'+this.id+'.edit-task').remove();
    let prevWord = $('#'+this.id+'.task').html();
    const form = HandlebarsTemplates['edit_task']({
      task: {id: this.id, content: prevWord}
    });
    $('#'+this.id+'.task').html(form);
  });
};
