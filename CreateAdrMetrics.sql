USE [master]
GO

DROP DATABASE IF EXISTS ADRMetrics;

/****** Object:  Database [ADRMetrics]    Script Date: 3/8/2021 11:33:48 AM ******/
CREATE DATABASE [ADRMetrics]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ADRMetrics', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ADRMetrics.mdf' , SIZE = 8192MB , MAXSIZE = UNLIMITED, FILEGROWTH = 1048576KB )
 LOG ON 
( NAME = N'ADRMetrics_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ADRMetrics_log.ldf' , SIZE = 8192MB , MAXSIZE = 2048GB , FILEGROWTH = 1048576KB )
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ADRMetrics].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [ADRMetrics] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [ADRMetrics] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [ADRMetrics] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [ADRMetrics] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [ADRMetrics] SET ARITHABORT OFF 
GO

ALTER DATABASE [ADRMetrics] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [ADRMetrics] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [ADRMetrics] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [ADRMetrics] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [ADRMetrics] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [ADRMetrics] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [ADRMetrics] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [ADRMetrics] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [ADRMetrics] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [ADRMetrics] SET  DISABLE_BROKER 
GO

ALTER DATABASE [ADRMetrics] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [ADRMetrics] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [ADRMetrics] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [ADRMetrics] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [ADRMetrics] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [ADRMetrics] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [ADRMetrics] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [ADRMetrics] SET RECOVERY FULL 
GO

ALTER DATABASE [ADRMetrics] SET  MULTI_USER 
GO

ALTER DATABASE [ADRMetrics] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [ADRMetrics] SET DB_CHAINING OFF 
GO

ALTER DATABASE [ADRMetrics] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [ADRMetrics] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [ADRMetrics] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [ADRMetrics] SET QUERY_STORE = OFF
GO

ALTER DATABASE [ADRMetrics] SET  READ_WRITE 
GO


