// See https://aka.ms/new-console-template for more information
Console.WriteLine("***This is a basic console application to create a personal notepad app!***");

String username = "";
String password = "";


File.WriteAllText("users.txt","");


displayMenu();


void displayMenu()
{

	int option = 0;



	while (option <= 5 && option >=0)
	{
		Console.ForegroundColor= ConsoleColor.Cyan;
		Console.WriteLine("Enter your choice: \n1.Create account\n2.View notes\n3.Add notes\n4.Logout\n5.Exit");
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
				viewnotes(username, password);
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
	Console.WriteLine("By creating an account, you will be able to : Add notes, view notes :)");
	username=getUsername();
	password=getPassword();

	if (username == "" || password == "")
	{
		username = getUsername();
		password = getPassword();
	}

	Console.Write("Confirm password: ");

	String cpassword = Console.ReadLine();
	while (cpassword == "")
	{
		Console.Write("Please enter password : ");
		cpassword = Console.ReadLine();
	}


	String path = username + password + ".txt";
	if (cpassword == password)
	{
		try
		{
			File.AppendAllText("users.txt", username + "$" + password);
			File.AppendAllText("usernames.txt", username+"\n");

			Console.WriteLine("Enter text u want to write in file: ");

			String notes = Console.ReadLine();
			notes = DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss") + "\t" + notes;
			File.WriteAllText(path, notes);
		}
		
			
			catch (Exception)
			{

                Console.WriteLine("Some error occurred!");
            }
		
		
	}
	else
	{
		username = "";
		password = "";
		Console.WriteLine("Passwords didnt match, please try again!");
	}

}


void viewnotes(String username, String password)
{
	
	if(username == "" || password == "")
	{
		username = getUsername();
		password = getPassword();
	}

	if (!checkusername(username)){
        Console.WriteLine("user doesnt exist!");
		username = "";
		password = "";
        displayMenu();
	}

	try
	{
		String alltext = File.ReadAllText(username + password + ".txt");
		if (alltext.Length > 0) {
			Console.WriteLine("Your notes is : ");
			Console.WriteLine("******************************************************");
			Console.WriteLine(alltext);
			Console.WriteLine("******************************************************");
		}
		else
		{
            Console.WriteLine("\n***No notes written yet!***\n");
        }
       

	}
	catch (Exception)
	{
		Console.WriteLine("Might be usernot exist!");
		password = "";
		username = "";
		Console.WriteLine("Do u want to create account!(y/n)");
		String x = Console.ReadLine();
		if (x == "y")
		{
			create();
		}
		else
		{
			username = "";
			password = "";
			Console.WriteLine("Thank you for using our app!");
		}

	}
}


void addnotes(String username, String password)
{

	//get user name and password first

	if (username == "" || password == "")
	{
		username = getUsername();
		password = getPassword();
	}

	if (!checkusername(username))
	{
		Console.WriteLine("User not found!");
		username = "";
		password = "";
	}
	String existing="";
	try
	{

		 existing = readtext(username, password);
		if (existing != "")
		{
			Console.WriteLine("**Existing notes is: **");

			Console.WriteLine(existing + "\n");

			Console.WriteLine("Enter text u want to write in file: ");

			Console.ForegroundColor = ConsoleColor.Red;
			String notes = Console.ReadLine();
			notes = DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss") + "\t" + notes;


			File.WriteAllText(username + password + ".txt", existing + "\n" + notes);
			Console.ForegroundColor = ConsoleColor.Green;
			Console.WriteLine("**Text added successfully!**");
		}
		else
		{
			Console.WriteLine("**start writing your notes now!**");
		}

	}
	catch (Exception)
	{
		username = "";
		password = "";
        Console.WriteLine("Wrong password!, please try again");
		
		
    }
	




}


String getUsername()
{
	username = "";
	Console.Write("Enter username: ");
	username= Console.ReadLine();

	if (username == "")
	{
		username = Console.ReadLine();
	}

	while (username == "")
	{
		Console.Write("Please enter username : ");
		username = Console.ReadLine();

	}
	
	return username;
}

String getPassword()
{
	password = "";
	Console.Write("Enter Password: ");
	password= Console.ReadLine();
	if (password == "")
	{
		password = Console.ReadLine();
	}
	while (password == "")
	{
		Console.Write("Please enter password : ");
		password = Console.ReadLine();
	}
	return password;
}



String readtext(String username,String password){
	return File.ReadAllText(username+password+".txt");
}


void logout()
{
	if (username == "" || password == "")
	{
		Console.WriteLine("**User already Logged out!**");
	}
	else
	{
		username = "";
		password = "";

		Console.ForegroundColor = ConsoleColor.Green;
		Console.WriteLine("**Logged out successfully!**");
		Console.ForegroundColor = ConsoleColor.White;
	}
	username = "";
	password = "";



}


bool checkusername(String username)
{
	String alltext = File.ReadAllText("usernames.txt");
	if (alltext.Contains(username))
	{

		return true;
	}

	else
	{
		return false;
	}
	return false;
}