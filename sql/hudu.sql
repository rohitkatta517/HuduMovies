USE [master]
GO
/****** Object:  Database [hudu]    Script Date: 5/17/2018 12:43:33 AM ******/
CREATE DATABASE [hudu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'hudu', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\hudu.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'hudu_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\hudu_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [hudu] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [hudu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [hudu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [hudu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [hudu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [hudu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [hudu] SET ARITHABORT OFF 
GO
ALTER DATABASE [hudu] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [hudu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [hudu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [hudu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [hudu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [hudu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [hudu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [hudu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [hudu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [hudu] SET  DISABLE_BROKER 
GO
ALTER DATABASE [hudu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [hudu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [hudu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [hudu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [hudu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [hudu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [hudu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [hudu] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [hudu] SET  MULTI_USER 
GO
ALTER DATABASE [hudu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [hudu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [hudu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [hudu] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [hudu] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [hudu] SET QUERY_STORE = OFF
GO
USE [hudu]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [hudu]
GO
/****** Object:  Table [dbo].[actor]    Script Date: 5/17/2018 12:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actor](
	[actor_id] [int] IDENTITY(1,1) NOT NULL,
	[actor_name] [varchar](50) NOT NULL,
	[actor_gender] [char](7) NOT NULL,
	[actor_wiki_link] [varchar](250) NULL,
 CONSTRAINT [PK_actor] PRIMARY KEY CLUSTERED 
(
	[actor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genre]    Script Date: 5/17/2018 12:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genre](
	[genre_id] [int] IDENTITY(1,1) NOT NULL,
	[genre_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_genre] PRIMARY KEY CLUSTERED 
(
	[genre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movie]    Script Date: 5/17/2018 12:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movie](
	[movie_id] [int] IDENTITY(1,1) NOT NULL,
	[movie_name] [varchar](50) NOT NULL,
	[movie_year] [int] NULL,
	[movie_description] [varchar](1000) NOT NULL,
	[movie_runtime] [int] NULL,
 CONSTRAINT [PK_movies] PRIMARY KEY CLUSTERED 
(
	[movie_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movie_actor]    Script Date: 5/17/2018 12:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movie_actor](
	[movie_id] [int] NOT NULL,
	[actor_id] [int] NOT NULL,
	[movie_actor_cast] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_movie_actor] PRIMARY KEY CLUSTERED 
(
	[movie_actor_cast] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movie_genre]    Script Date: 5/17/2018 12:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movie_genre](
	[movie_genre_id] [int] IDENTITY(1,1) NOT NULL,
	[movie_id] [int] NOT NULL,
	[genre_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment]    Script Date: 5/17/2018 12:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment](
	[payment_id] [int] IDENTITY(1,1) NOT NULL,
	[payment_user_id] [int] NOT NULL,
	[payment_card_number] [varchar](16) NOT NULL,
	[payment_card_cvv] [int] NOT NULL,
	[payement_card_expiry] [date] NOT NULL,
 CONSTRAINT [PK_user_payment] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 5/17/2018 12:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [varchar](10) NOT NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 5/17/2018 12:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_fname] [varchar](25) NOT NULL,
	[user_lname] [varchar](25) NULL,
	[user_date_of_birth] [date] NULL,
	[user_email] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[passwordhash] [varchar](max) NOT NULL,
	[role_id] [int] NOT NULL,
	[user_is_active] [int] NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_movie]    Script Date: 5/17/2018 12:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_movie](
	[user_movies_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[movie_id] [int] NOT NULL,
	[movie_rental_expiry] [date] NOT NULL,
	[movie_owns] [int] NULL,
	[movie_tx_date] [date] NOT NULL,
 CONSTRAINT [PK_user_movie] PRIMARY KEY CLUSTERED 
(
	[user_movies_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[actor] ON 

INSERT [dbo].[actor] ([actor_id], [actor_name], [actor_gender], [actor_wiki_link]) VALUES (1, N'Johnny Depp', N'Male   ', N'https://en.wikipedia.org/wiki/Johnny_Depp')
INSERT [dbo].[actor] ([actor_id], [actor_name], [actor_gender], [actor_wiki_link]) VALUES (2, N'Tom Cruise', N'Male   ', N'https://en.wikipedia.org/wiki/Tom_Cruise')
INSERT [dbo].[actor] ([actor_id], [actor_name], [actor_gender], [actor_wiki_link]) VALUES (3, N'Brad Pitt', N'Male   ', N'https://en.wikipedia.org/wiki/Brad_Pitt')
INSERT [dbo].[actor] ([actor_id], [actor_name], [actor_gender], [actor_wiki_link]) VALUES (4, N'Angelina Jolie', N'Female ', N'https://en.wikipedia.org/wiki/Angelina_Jolie')
INSERT [dbo].[actor] ([actor_id], [actor_name], [actor_gender], [actor_wiki_link]) VALUES (5, N'Blake Lively', N'Female ', N'https://en.wikipedia.org/wiki/Blake_Lively')
INSERT [dbo].[actor] ([actor_id], [actor_name], [actor_gender], [actor_wiki_link]) VALUES (6, N'Eva Green', N'Female ', N'https://en.wikipedia.org/wiki/Eva_Green')
SET IDENTITY_INSERT [dbo].[actor] OFF
SET IDENTITY_INSERT [dbo].[genre] ON 

INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (1, N'Action')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (2, N'Adventure')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (3, N'Biography')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (4, N'Comedy')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (5, N'Documentary')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (6, N'Romance')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (7, N'Horror')
INSERT [dbo].[genre] ([genre_id], [genre_name]) VALUES (8, N'Thriller')
SET IDENTITY_INSERT [dbo].[genre] OFF
SET IDENTITY_INSERT [dbo].[movie] ON 

INSERT [dbo].[movie] ([movie_id], [movie_name], [movie_year], [movie_description], [movie_runtime]) VALUES (1, N'Mission Impossible: Rogue Nation', 2015, N'Ethan and team take on their most impossible mission yet, eradicating the Syndicate - an International rogue organization as highly skilled as they are, committed to destroying the IMF.', 131)
INSERT [dbo].[movie] ([movie_id], [movie_name], [movie_year], [movie_description], [movie_runtime]) VALUES (2, N'Green Lantern', 2011, N'Reckless test pilot Hal Jordan is granted an alien ring that bestows him with otherworldly powers that inducts him into an intergalactic police force, the Green Lantern Corps.', 114)
INSERT [dbo].[movie] ([movie_id], [movie_name], [movie_year], [movie_description], [movie_runtime]) VALUES (3, N'Casino Royale', 2006, N'Armed with a license to kill, Secret Agent James Bond sets out on his first mission as 007, and must defeat a private banker to terrorists in a high stakes game of poker at Casino Royale, Montenegro, but things are not what they seem.', 144)
INSERT [dbo].[movie] ([movie_id], [movie_name], [movie_year], [movie_description], [movie_runtime]) VALUES (10, N'Pirates of the Caribbean: Curse on the black pearl', 2003, N'Blacksmith Will Turner teams up with eccentric pirate "Captain" Jack Sparrow to save his love, the governor''s daughter, from Jack''s former pirate allies, who are now undead.', 143)
SET IDENTITY_INSERT [dbo].[movie] OFF
SET IDENTITY_INSERT [dbo].[movie_actor] ON 

INSERT [dbo].[movie_actor] ([movie_id], [actor_id], [movie_actor_cast]) VALUES (1, 2, 2)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id], [movie_actor_cast]) VALUES (2, 5, 3)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id], [movie_actor_cast]) VALUES (3, 6, 4)
INSERT [dbo].[movie_actor] ([movie_id], [actor_id], [movie_actor_cast]) VALUES (10, 1, 5)
SET IDENTITY_INSERT [dbo].[movie_actor] OFF
SET IDENTITY_INSERT [dbo].[movie_genre] ON 

INSERT [dbo].[movie_genre] ([movie_genre_id], [movie_id], [genre_id]) VALUES (1, 1, 1)
INSERT [dbo].[movie_genre] ([movie_genre_id], [movie_id], [genre_id]) VALUES (2, 1, 2)
INSERT [dbo].[movie_genre] ([movie_genre_id], [movie_id], [genre_id]) VALUES (3, 1, 8)
INSERT [dbo].[movie_genre] ([movie_genre_id], [movie_id], [genre_id]) VALUES (4, 2, 2)
INSERT [dbo].[movie_genre] ([movie_genre_id], [movie_id], [genre_id]) VALUES (5, 2, 1)
INSERT [dbo].[movie_genre] ([movie_genre_id], [movie_id], [genre_id]) VALUES (6, 2, 8)
INSERT [dbo].[movie_genre] ([movie_genre_id], [movie_id], [genre_id]) VALUES (7, 3, 1)
INSERT [dbo].[movie_genre] ([movie_genre_id], [movie_id], [genre_id]) VALUES (8, 3, 4)
INSERT [dbo].[movie_genre] ([movie_genre_id], [movie_id], [genre_id]) VALUES (9, 10, 1)
INSERT [dbo].[movie_genre] ([movie_genre_id], [movie_id], [genre_id]) VALUES (10, 10, 2)
INSERT [dbo].[movie_genre] ([movie_genre_id], [movie_id], [genre_id]) VALUES (11, 10, 3)
INSERT [dbo].[movie_genre] ([movie_genre_id], [movie_id], [genre_id]) VALUES (12, 10, 4)
INSERT [dbo].[movie_genre] ([movie_genre_id], [movie_id], [genre_id]) VALUES (13, 10, 5)
INSERT [dbo].[movie_genre] ([movie_genre_id], [movie_id], [genre_id]) VALUES (14, 10, 6)
INSERT [dbo].[movie_genre] ([movie_genre_id], [movie_id], [genre_id]) VALUES (15, 10, 7)
INSERT [dbo].[movie_genre] ([movie_genre_id], [movie_id], [genre_id]) VALUES (16, 10, 8)
SET IDENTITY_INSERT [dbo].[movie_genre] OFF
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([role_id], [role_name]) VALUES (1, N'Admin')
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[role] OFF
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([user_id], [user_fname], [user_lname], [user_date_of_birth], [user_email], [password], [passwordhash], [role_id], [user_is_active]) VALUES (2, N'Harsha', N'Keerthipati', CAST(N'1111-01-01' AS Date), N'harshavarma93@gmail.com', N'harsha93', N'623ddb0634354fe400e75d811a0094a6', 1, 1)
INSERT [dbo].[user] ([user_id], [user_fname], [user_lname], [user_date_of_birth], [user_email], [password], [passwordhash], [role_id], [user_is_active]) VALUES (3, N'admin', N'admin', CAST(N'1970-01-01' AS Date), N'admin@gmail.com', N'admin123', N'0192023a7bbd73250516f069df18b500', 2, 1)
SET IDENTITY_INSERT [dbo].[user] OFF
ALTER TABLE [dbo].[movie_actor]  WITH CHECK ADD  CONSTRAINT [FK_movie_actor_actor] FOREIGN KEY([actor_id])
REFERENCES [dbo].[actor] ([actor_id])
GO
ALTER TABLE [dbo].[movie_actor] CHECK CONSTRAINT [FK_movie_actor_actor]
GO
ALTER TABLE [dbo].[movie_actor]  WITH CHECK ADD  CONSTRAINT [FK_movie_actor_movie] FOREIGN KEY([movie_id])
REFERENCES [dbo].[movie] ([movie_id])
GO
ALTER TABLE [dbo].[movie_actor] CHECK CONSTRAINT [FK_movie_actor_movie]
GO
ALTER TABLE [dbo].[movie_genre]  WITH CHECK ADD  CONSTRAINT [FK_movie_genre_genre_id] FOREIGN KEY([genre_id])
REFERENCES [dbo].[genre] ([genre_id])
GO
ALTER TABLE [dbo].[movie_genre] CHECK CONSTRAINT [FK_movie_genre_genre_id]
GO
ALTER TABLE [dbo].[movie_genre]  WITH CHECK ADD  CONSTRAINT [FK_movie_genre_movie_id] FOREIGN KEY([movie_id])
REFERENCES [dbo].[movie] ([movie_id])
GO
ALTER TABLE [dbo].[movie_genre] CHECK CONSTRAINT [FK_movie_genre_movie_id]
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD  CONSTRAINT [FK_payment_user] FOREIGN KEY([payment_user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[payment] CHECK CONSTRAINT [FK_payment_user]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_role] FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([role_id])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_role]
GO
ALTER TABLE [dbo].[user_movie]  WITH CHECK ADD  CONSTRAINT [FK_user_movie_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[user_movie] CHECK CONSTRAINT [FK_user_movie_id]
GO
ALTER TABLE [dbo].[user_movie]  WITH CHECK ADD  CONSTRAINT [FK_user_movie_movie] FOREIGN KEY([movie_id])
REFERENCES [dbo].[movie] ([movie_id])
GO
ALTER TABLE [dbo].[user_movie] CHECK CONSTRAINT [FK_user_movie_movie]
GO
USE [master]
GO
ALTER DATABASE [hudu] SET  READ_WRITE 
GO
