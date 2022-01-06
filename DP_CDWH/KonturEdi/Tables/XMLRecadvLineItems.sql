CREATE TABLE [KonturEdi].[XMLRecadvLineItems] (
    [XMLRecadvLineItemID]             BIGINT           IDENTITY (1, 1) NOT NULL,
    [eDIMessageID]                    UNIQUEIDENTIFIER NOT NULL,
    [GTIN]                            NVARCHAR (20)    NULL,
    [InternalBuyerCode]               NVARCHAR (20)    NULL,
    [InternalSupplierCode]            NVARCHAR (20)    NULL,
    [Description]                     NVARCHAR (255)   NULL,
    [OrderedQuantity]                 NUMERIC (10, 3)  NULL,
    [OrderedQuantityUnitOfMeasure]    NVARCHAR (20)    NULL,
    [DespatchedQuantity]              NUMERIC (10, 3)  NULL,
    [DespatchedQuantityUnitOfMeasure] NVARCHAR (20)    NULL,
    [AcceptedQuantity]                NUMERIC (10, 3)  NULL,
    [AcceptedQuantityUnitOfMeasure]   NVARCHAR (20)    NULL,
    [OnePlaceQuantity]                NUMERIC (10, 3)  NULL,
    [OnePlaceQuantityUnitOfMeasure]   NVARCHAR (20)    NULL,
    [NetPrice]                        NUMERIC (10, 4)  NULL,
    [NetPriceWithVAT]                 NUMERIC (10, 4)  NULL,
    [NetAmount]                       NUMERIC (10, 4)  NULL,
    [VATRate]                         INT              NULL,
    [VATAmount]                       NUMERIC (10, 4)  NULL,
    [Amount]                          NUMERIC (10, 4)  NULL,
    CONSTRAINT [PK_XMLRecadvLineItems_1] PRIMARY KEY CLUSTERED ([XMLRecadvLineItemID] ASC)
);


GO

