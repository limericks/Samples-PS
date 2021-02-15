# Samples-PS
Samples-PS is a collection of powershell samples and simple utilities. 

<h2>CryptoTransactionRecorder</h2> <br/>
<p>CryptoTransactionRecorder.ps1 is used to check cryptocurrency prices with the coinbase api and to record transactions in a sql database. This does not interface with the purchasing and sales endpoints of coinbase or any other crytocurrency exchange.</p>
<p>To record transactions to SQL: 
<ol>
        <li>Create a database for the tables. I used "CrypTransactions" as mine.  </li>
        <li>Create a table for purchases named dbo.Buys</li>
        <li>Create a table for sales names dbo.Sales</li>
</ol>
</p>

<h4>dbo.Buys</h4>
<div>
        USE [CrypTransactions]
GO

/****** Object:  Table [dbo].[Buys]    Script Date: 2/14/2021 *****/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Buys](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Coin] [nvarchar](50) NOT NULL,
	[USD Spent] [decimal](18, 4) NULL,
	[Coins Received] [decimal](18, 4) NULL,
	[Coin Symbol] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Buys] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
</div>

<h4>dbo.Sales</h4>
<div>
        USE [CrypTransactions]
GO

/****** Object:  Table [dbo].[Sales]    Script Date: 2/14/2021 *****/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Sales](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[USD Received] [decimal](18, 4) NULL,
	[Coins Sold] [decimal](18, 4) NULL,
	[Coin] [nvarchar](50) NULL,
	[Coin Symbol] [nchar](10) NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
</div<


