CREATE DATABASE [WithAdrTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WithAdrTest', FILENAME = N'F:\data\WithAdrTest.mdf' , SIZE = 8388608KB , FILEGROWTH = 1048576KB )
 LOG ON 
( NAME = N'WithAdrTest_log', FILENAME = N'G:\log\WithAdrTest_log.ldf' , SIZE = 8388608KB , FILEGROWTH = 1048576KB )
GO
ALTER DATABASE [WithAdrTest] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [WithAdrTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WithAdrTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WithAdrTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WithAdrTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WithAdrTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [WithAdrTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WithAdrTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WithAdrTest] SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF)
GO
ALTER DATABASE [WithAdrTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WithAdrTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WithAdrTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WithAdrTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WithAdrTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WithAdrTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WithAdrTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WithAdrTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WithAdrTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WithAdrTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WithAdrTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WithAdrTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WithAdrTest] SET  READ_WRITE 
GO
ALTER DATABASE [WithAdrTest] SET RECOVERY FULL 
GO
ALTER DATABASE [WithAdrTest] SET  MULTI_USER 
GO
ALTER DATABASE [WithAdrTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WithAdrTest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WithAdrTest] SET DELAYED_DURABILITY = DISABLED 
GO
USE [WithAdrTest]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = Off;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = Primary;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = On;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = Primary;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = Off;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = Primary;
GO
USE [WithAdrTest]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE [WithAdrTest] MODIFY FILEGROUP [PRIMARY] DEFAULT
GO
