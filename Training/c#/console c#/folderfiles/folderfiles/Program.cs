
File.AppendAllText("users.txt", "");
File.AppendAllText("usernames.txt", "");


displayMenu();


void displayMenu()
{

	int option = 0;



	while (option <= 5 && option >= 0)
	{
		Console.ForegroundColor = ConsoleColor.Cyan;
		Console.WriteLine("Enter your choice: \n1.Create account\n2.View files\n3.Add new file\n4.Add content to existing file\n5.view content in file\n6.Exit");
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
				viewfiles();
				break;
			case 3:
				addnew();
				break;
			case 4:
				addtext();
				break;
			case 5:
				viewcontent();
				break;
			case 6:
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
	
	

	String username=getusername();
	if (isuser(username))
	{
		Console.WriteLine("Username already taken, try again!");
		return;
	}
	
	String password = getpassword();
	File.AppendAllText("usernames.txt", username + "\n"); //allusernames are storeda nd separated by $
	File.AppendAllText("users.txt", username + "&" + password + "\n");

   
	// Ensure the directory exists
	string directoryPath = @"D:\Snovasys\snovasysgithub\Training\c#\console c#\folderfiles\folderfiles\bin\Debug\net8.0\" + username;
	Directory.CreateDirectory(directoryPath);

    Console.WriteLine("Account created successfully!");




}

bool isuser(String username)
{
	String[] allusers = File.ReadAllText("usernames.txt").Split("\n");
	if (allusers.Contains(username))
	{
		return true;
	}

	return false;
}

/*
 *  Console.WriteLine("Enter file name to store: ");

    String file=Console.ReadLine();

    Console.WriteLine("Enter notes : ");
    String notes = Console.ReadLine();


string filePath = Path.Combine(directoryPath, file + ".txt");
	File.AppendAllText(filePath, notes+"\n");
	Console.WriteLine("**Notes added successfully!");
*/


String getusername()
{
	Console.Write("Enter username : ");
	String username = Console.ReadLine();
	while (username == "")
	{
		Console.Write("Enter username : ");
		username = Console.ReadLine();
	}

	return username;
}

String getpassword()
{


	Console.Write("Enter password : ");
	String password = Console.ReadLine();
	while (password == "")
	{
		Console.Write("Enter password : ");
		password = Console.ReadLine();
	}

	return password;
}


void viewfiles()
{
	String username = getusername();

	String[] usernames = File.ReadAllText("usernames.txt").Split("\n");
	if(usernames.Length > 0)
	{
		if(!usernames.Contains(username))
		{
            Console.WriteLine("No user found, please create account first!");
        }
		else
		{
			string folderPath = @"D:\Snovasys\snovasysgithub\Training\c#\console c#\folderfiles\folderfiles\bin\Debug\net8.0\" + username;


			string[] textFiles = Directory.GetFiles(folderPath, "*.txt");

			// Display the list of text files
			Console.WriteLine("Text Files in " + folderPath + ":");
			Console.WriteLine("Total no of files:"+textFiles.Length);
			foreach (string filePath in textFiles)
			{
				Console.WriteLine(Path.GetFileName(filePath));
			}
		}
	}

}

void addnew()
{
	String username=getusername();
	Console.WriteLine("Enter file name");
	String filename=Console.ReadLine();

	if (!checkfilename(username, filename))
	{
		string folderPath = @"D:\Snovasys\snovasysgithub\Training\c#\console c#\folderfiles\folderfiles\bin\Debug\net8.0\" + username;
		Console.WriteLine("Enter notes : ");
		String notes = Console.ReadLine();


		string filePath = Path.Combine(folderPath, filename + ".txt");
		File.AppendAllText(filePath, notes + "\n");
		Console.WriteLine("**Notes added successfully!");
	}
	else
	{
        Console.WriteLine("FIle name already exists, try another");
    }
}


bool checkfilename(String username,String name)
{
	string folderPath = @"D:\Snovasys\snovasysgithub\Training\c#\console c#\folderfiles\folderfiles\bin\Debug\net8.0\" + username;


	string[] textFiles = Directory.GetFiles(folderPath, "*.txt");

	
	if(textFiles.Length > 0 && textFiles.Contains(name))
	{
		return true;
	}

	return false;
}


void addtext()
{
	String username = getusername();

	String[] usernames = File.ReadAllText("usernames.txt").Split("\n");
	if (usernames.Length > 0)
	{
		if (!usernames.Contains(username))
		{
			Console.WriteLine("No user found, please create account first!");
		}
		else
		{
			string folderPath = @"D:\Snovasys\snovasysgithub\Training\c#\console c#\folderfiles\folderfiles\bin\Debug\net8.0\" + username;


			string[] textFiles = Directory.GetFiles(folderPath, "*.txt");

			// Display the list of text files
			Console.WriteLine("Text Files in " + folderPath + ":");
			Console.WriteLine("Total no of files:" + textFiles.Length);

            

            int index = 0;
            
            foreach (string filePath in textFiles)
			{
				Console.WriteLine( index+1 + ": " + Path.GetFileName(filePath));
				index++;
			}

			Console.WriteLine("Select which file you want to write/edit: ");
			int number=Convert.ToInt32(Console.ReadLine());
			if (number > textFiles.Length)
			{
				Console.WriteLine("**Please enter file number from avaialble files: ");
				return;
			}
			Console.WriteLine("Enter notes: ");
			String notes=Console.ReadLine();

			

			File.AppendAllText( textFiles[number-1], notes+"\n");

        }
	}

   

}



void viewcontent()
{
	String username=getusername();

	String[] usernames = File.ReadAllText("usernames.txt").Split("\n");
	if (usernames.Length > 0)
	{
		if (!usernames.Contains(username))
		{
			Console.WriteLine("No user found, please create account first!");
		}
		else
		{
			string folderPath = @"D:\Snovasys\snovasysgithub\Training\c#\console c#\folderfiles\folderfiles\bin\Debug\net8.0\" + username;


			string[] textFiles = Directory.GetFiles(folderPath, "*.txt");

			// Display the list of text files
			Console.WriteLine("Text Files in " + folderPath + ":");
			Console.WriteLine("Total no of files:" + textFiles.Length);



			int index = 0;
			
			foreach (string filePath in textFiles)
			{
				Console.WriteLine(index + 1 + ": " + Path.GetFileName(filePath));
				index++;
			}

			Console.WriteLine("Select which file you want to read: ");
			int number = Convert.ToInt32(Console.ReadLine());
			if (number > textFiles.Length)
			{
				Console.WriteLine("**Please enter file number from avaialble files: ");
				return;
			}

			String notes=File.ReadAllText(textFiles[number-1]);
            Console.WriteLine(notes);





        }
	}

}