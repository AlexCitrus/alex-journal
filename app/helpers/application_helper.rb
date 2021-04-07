module ApplicationHelper
    
    def task_label(task)
      status = :''
      message = :''
  
      deadline = Time.new(task.deadline.year, task.deadline.month, task.deadline.day)
  
      (status = :'success' and message = :'Completed') if task.completed
      (status = :'danger' and message = :'Past due!') if deadline.past? and !task.completed
      (status = :'light' and message = :'In-progress') if deadline.future? and !task.completed
      (status = :'warning' and message = :'Due Today!') if deadline.today? and !task.completed
  
      html = <<-HTML
        <span class="tile-status py-1 px-2 completed-#{status}">
          <span class="has-text-#{status}">#{message}</span>
        </span>
      HTML
  
      { html: html, message: message, status: status }
    end

    def date_parse(date_object)
        date_object.strftime("%A, %d %b %Y")
    end
  
  end
  