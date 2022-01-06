CREATE TABLE [KonturEdi].[XMLOrderLineItems] (
    [XMLOrderLineItemID]             BIGINT           IDENTITY (1, 1) NOT NULL,
    [eDIMessageID]                   UNIQUEIDENTIFIER NOT NULL,
    [GTIN]                           NVARCHAR (20)    NULL,
    [InternalBuyerCode]              NVARCHAR (20)    NULL,
    [Description]                    NVARCHAR (255)   NULL,
    [RequestedQuantity]              NUMERIC (10, 3)  NULL,
    [RequestedQuantityUnitOfMeasure] NVARCHAR (20)    NULL,
    [OnePlaceQuantity]               NUMERIC (10, 3)  NULL,
    [OnePlaceQuantityUnitOfMeasure]  NVARCHAR (20)    NULL,
    [NetPrice]                       NUMERIC (10, 4)  NULL,
    [NetPriceWithVAT]                NUMERIC (10, 4)  NULL,
    [PriceCataloguePrice]            NUMERIC (10, 4)  NULL,
    [NetAmount]                      NUMERIC (10, 4)  NULL,
    [PackageQuantity]                NUMERIC (10, 3)  NULL,
    [VATRate]                        INT              NULL,
    CONSTRAINT [PK_XMLOrderLineItems_1] PRIMARY KEY CLUSTERED ([XMLOrderLineItemID] ASC)
);


GO

