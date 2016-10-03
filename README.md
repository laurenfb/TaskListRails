### Reflection on task list project:

I really enjoyed working with Rails. The whole group seemed to be moving at about the same pace, which was great because we were able to ask questions of each other rather than relying on teachers and TAs. The best part was that oftentimes I'd answer a question for a classmate, then turn around 20 minutes later and ask them for help. The collaborative aspect was great. 

I'm proud of rendering the buttons partial (is this the correct phrasing? i have no idea!). It's pretty cool to see the same buttons repeated everywhere. If I'd had time on Friday I would also have done so for the editing vs. entry form. But since I'd already hit the optional requirement I decided not to over the weekend.

My 2 chair pairs (chair trio!) were Jeannie and Melissa. I liked that Melissa's app was more user-friendly in its organization and the UI  made more sense (she separated out the open vs. completed tasks from the user's perspective, which was really cool). Jeannie is really good at making sure the correct logic goes in the right place (model vs. controller), and I take inspiration from her understanding of this compartmentalization.

The thing I'd definitely change about my app, if I could, is the very strange way that the font sizes sometimes break after you delete a task. I have no idea what's causing this, since it's definitely rendering the rest of my CSS ......... just not the right font sizes, and only after deletion.






# Task List Rails ✅
We are going to build a Task List in Rails. This web application will enable us to keep track of list of tasks with the functionality to add, edit and remove tasks from a list.

Tracking tasks in a web app will let us focus on following Rails conventions and learning how data flows through a Rails application.

## Baseline
**Once you've achieved this baseline, take a walk around the room and see if you can answer questions or help other folks.**

This project...

- Will have our standard Github setup (fork this repo and clone to your machine)
- requires you to create a Rails application
  - create a controller for your `Tasks`
  - conform to Rails conventions on naming and inflection

Baseline Part 2:
- create a `Task` model and migration.
  - create the database schema and tables with `rake db:migrate`
  - the `Task` model should include _at least_ a name, a description and a completion indicator

Tinker with your Model in the `rails console` in order to ensure you have created your model and can interact with it as expected.

## Task Data Requirements

Each task record will include all of the following. Optional in this context means that the user may choose not to provide this information, but it is still required for your schema:
- Self-incrementing identifier (ID)
- title: the title of the task
- description: details about the task
- completed_at: the time and date the task was completed

## 🌊 Wave 1
This wave is where we will introduce the view layer to interact with our application via the browser.

- Set up necessary controller(s) and route(s) that you will need in order to show a task from the database
- Create a root route for your application that directs users to the list of all tasks
  - Each task name in the list should link to a `show` action that will render a new view for the user.
  - The `show` view should include the complete information about the task: name, description, completion status, and completion date.
- All markup in all views should have semantic relevance.


## 🌊 Wave 2
In this wave we will add the first set of user interactivity and persistence.

- Be able to create a new task:
  - The home page should contain a link to Add a new task. This will give the user a form to fill out with the appropriate task fields.
  - After the new task is added, the site should take the user back to the home page which displays the full list of tasks. The new task that was just added should be included in the full list of tasks.
- Be able to delete an existing task:
  - Add a route and controller action whose responsibility is deleting a task (RESTful routes)
  - On the home page, add a button or link for each task that will, once clicked...
    1. Ask the user to confirm that they definitely want to delete the task.
    1. Delete the task from the database and redirect the user back to the list of remaining tasks

<!-- ## 🌊 Wave 3
In this wave we will extend the interactivity with users, allowing them to edit existing tasks in a couple of different ways. As always, follow _RESTful_ conventions when implementing these features.

- Add the ability for the user to mark a task complete
  - Add a button to the list of tasks on the home page that, when clicked, will mark a task complete.
  - Update the database with the task's completed date
- Add the ability for the user to edit a task's details.
  - Add an `edit` action that renders a form allowing the user to update all the fields of a task.
  - Submitting the form from the `edit` action should _update_ the existing task; not create a new one.
    - Research: ActiveRecord's `update` method.
  - Link to the `edit` action from the task's `show` page.
  - DRY up your code by reusing the view code from the `new` functionality
    - Hint: Rendering _partials_ in Rails.

 -->
