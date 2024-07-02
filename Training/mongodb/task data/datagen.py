import random
from datetime import datetime, timedelta
import json

# Generate unique IDs
def generate_id(prefix, number):
    return f"{prefix}{str(number).zfill(5)}"

# Generate random date
def random_date(start, end):
    return start + timedelta(days=random.randint(0, (end - start).days))

# Initialize data containers
projects = []
users = []
tasks = []

# Project, user, and task counts
num_projects = 30
num_users = 100
num_tasks = 200

# Date range for random dates
start_date = datetime(2024, 1, 1)
end_date = datetime(2024, 12, 31)

# Role options
roles = ["Project Manager", "Lead Developer", "QA Engineer", "UI/UX Designer", "DevOps Engineer", "Business Analyst"]

# Generate users
for i in range(num_users):
    user = {
        "user_id": generate_id("U", i+1),
        "name": f"User {i+1}",
        "role": random.choice(roles)
    }
    users.append(user)

# Generate projects
for i in range(num_projects):
    project_id = generate_id("PRJ", i+1)
    project_name = f"Project {i+1}"
    project_description = f"Description of {project_name}"
    project_budget = random.randint(100000, 1000000)
    
    project_team_size = random.randint(3, 6)
    project_team = random.sample(users, project_team_size)
    
    project_tasks = []
    num_project_tasks = random.randint(5, 10)
    for j in range(num_project_tasks):
        task_id = generate_id("T", len(tasks) + 1)
        task_name = f"Task {len(tasks) + 1} for {project_name}"
        assigned_user = random.choice(project_team)
        due_date = random_date(start_date, end_date)
        
        task = {
            "task_id": task_id,
            "task_name": task_name,
            "assigned_to": assigned_user["user_id"],
            "due_date": {"$date": due_date.isoformat()}
        }
        tasks.append(task)
        project_tasks.append(task)
    
    project = {
        "pid": project_id,
        "pname": project_name,
        "description": project_description,
        "start": {"$date": random_date(start_date, end_date).isoformat()},
        "end": {"$date": random_date(start_date, end_date).isoformat()},
        "budget": project_budget,
        "scope": f"Scope of {project_name}",
        "team": project_team,
        "tasks": project_tasks
    }
    projects.append(project)

# Save to JSON file
data = {
    "projects": projects,
    "users": users,
    "tasks": tasks
}

with open('projects_data.json', 'w') as f:
    json.dump(data, f, indent=2)

print("Data generation complete!")
