// See https://aka.ms/new-console-template for more information
Console.WriteLine("***This is a basic console application to create a personal notepad app!***");

String username = "";
String password = "";

File.AppendAllText("users.txt", "");
File.AppendAllText("usernames.txt", "");



displayMenu();


void displayMenu()
{

	int option = 0;



	while (option <= 5 && option >= 0)
	{
		Console.ForegroundColor = ConsoleColor.Cyan;
		Console.WriteLine("Enter your choice: \n1.Create file\n2.View files\n3.Add new file\n4.Logout\n5.Exit");
		Console.ForegroundColor = ConsoleColor.White;


		try
		{
			option = Convert.ToInt32(Console.ReadLine());
		}
		catch (Exception)
		{

			//nothing to return in exception
		}



		switch (option)
		{
			case 1:
				create();

				break;

			case 2:
				viewnotes(username,password); 
				break;	
			case 3:
				addnotes(username, password);
				break;
			case 4:
				logout();
				break;

			case 5:
				option = -1;
				break;
			

			default:
				Console.WriteLine("User input wrong, please enter again!");
				break;
		}
	}

}

void create()
{
	username = getUsername();
	while (checkuser(username))
	{
		Console.WriteLine("username already taken, please try another");
		getUsername();
		
	}

	password = getPassword();

	File.AppendAllText("usernames.txt", username + "$"); //allusernames are storeda nd separated by $
	File.AppendAllText("users.txt", username + "&" + password+"$");		//user detials also separaed by $
    Console.WriteLine("Enter notes you want to note down:");
	String notes = Console.ReadLine();
	// Ensure the directory exists
	string directoryPath = @"D:\Snovasys\snovasysgithub\Training\c#\console c#\Notepad\Notepad\bin\Debug\net8.0\" + username;
	Directory.CreateDirectory(directoryPath);

	
	string filePath = Path.Combine(directoryPath,  username + ".txt");
	File.AppendAllText(filePath, notes);
    Console.WriteLine("**Notes added successfully!");



}


String getUsername()
{
	username = "";
	

	while (username == "")
	{
		Console.Write("Enter username : ");
		username=Console.ReadLine();
	}

	return username;
}


String getPassword()
{
	
	password = "";

	while (password == "")
	{
		Console.Write("Enter password : ");
		password = Console.ReadLine();
	}

	return password;
}


bool checkuser(String username)
{
	String[] allusers = File.ReadAllText("usernames.txt").Split("$");

	/*string[] userArray = allusers.Split('$');
    foreach (String user in userArray)
	{
        Console.WriteLine(user);
    }*/
	if (allusers.Contains(username))
	{
		return true;
	}
    return false; 
}

void viewnotes(String username,String password)
{
	if (username == "" || password == "")
	{
		username = "";
		password = "";
		username = getUsername();
		password = getPassword();
	}

	if (!checkuser(username))
	{
		Console.WriteLine("User doenst exist with the credentials! Please create account first!");
		username = getUsername();
		password = getPassword();
		
	}
    else
    {
		string folderPath = @"D:\Snovasys\snovasysgithub\Training\c#\console c#\Notepad\Notepad\bin\Debug\net8.0\"+username;


		string[] textFiles = Directory.GetFiles(folderPath, "*.txt");

		// Display the list of text files
		Console.WriteLine("Text Files in " + folderPath + ":");
        Console.WriteLine(textFiles.Length);
        foreach (string filePath in textFiles)
		{
			Console.WriteLine(Path.GetFileName(filePath));
		}

		/*
		String[] allusers = File.ReadAllText("users.txt").Split("$");
		foreach (String user in allusers)
		{
			if (username + "&" + password == user)
			{
				String notes=File.ReadAllText(username  + password+".txt");
                Console.WriteLine("***\n"+notes+"\n***");
				break;
            }

		}

		*/


    }

}


void logout()
{
	if(password!="" || username!="")
	{
		username = "";
		password = "";
        Console.WriteLine("Logged out successfully!");
    }
	else
	{
        Console.WriteLine("No user logged in yet!");
    }
}


void addnotes(String username,String password)
{


	if (username == "" || password == "")
	{
		
		username = getUsername();
		if (checkuser(username))
		{
			password = getPassword();
		}
		
	}

	if (!checkuser(username))
	{
		Console.WriteLine("No user found with credentials, please try again!");
		username = "";
		password = "";

	}
	else
	{
		int status = 0;
		String[] users = File.ReadAllText("users.txt").Split("$");
		foreach(String user in users)
		{
            
            if (username + "&" + password == user)
			{
                Console.WriteLine("Enter new notes:");
                String notes=Console.ReadLine();
				File.AppendAllText(username + password + ".txt", notes+"\n");
                Console.WriteLine("**Notes added successfuly!");
				status = 1;


            }
			else
			{
                
				continue;
            }
		}

		if (status == 0)
		{
            Console.WriteLine("Try checking password once!");


			username = "";
			password = "";
            Console.WriteLine(username,password);

        }


	}


}