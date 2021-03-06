CREATE TABLE [Utils].[Calendars] (
    [CalendarID]        INT           NOT NULL,
    [NAME]              VARCHAR (255) NULL,
    [SHORT_NAME]        VARCHAR (255) NULL,
    [REPORT_DATE]       DATETIME      NULL,
    [DT_LEVEL]          INT           NOT NULL,
    [START_DATE]        DATE          NULL,
    [FINISH_DATE]       DATE          NULL,
    [COUNT_DAYS_PERIOD] INT           NULL,
    [N_DAY_W]           INT           NULL,
    [N_DAY_W_NAME]      VARCHAR (32)  NULL,
    [N_DAY_M]           INT           NULL,
    [N_MONTH_Y]         INT           NULL,
    [N_KVART_Y]         INT           NULL,
    [N_HALFYEAR_Y]      INT           NULL,
    [N_YEAR]            INT           NULL,
    [N_FIVE_M]          INT           NULL,
    [N_DECADE_M]        INT           NULL,
    [IS_HOLIDAY]        INT           NULL,
    [IS_WORKDAY]        INT           NULL,
    [IS_LASTDAY_M]      INT           NULL,
    [FIRST_DAY_MONTH]   DATE          NULL,
    [FIRST_DAY_WEEK]    DATE          NULL,
    [PREV_YEAR_ID]      INT           NULL,
    [PREV_HALFYEAR_ID]  INT           NULL,
    [PREV_QUARTER_ID]   INT           NULL,
    [PREV_MONTH_ID]     INT           NULL,
    [PREV_DECADE_ID]    INT           NULL,
    [PREV_WEEK_ID]      INT           NULL,
    [PREV_DAY_ID]       INT           NULL,
    [NEXT_YEAR_ID]      INT           NULL,
    [NEXT_HALFYEAR_ID]  INT           NULL,
    [NEXT_QUARTER_ID]   INT           NULL,
    [NEXT_MONTH_ID]     INT           NULL,
    [NEXT_DECADE_ID]    INT           NULL,
    [NEXT_WEEK_ID]      INT           NULL,
    [NEXT_DAY_ID]       INT           NULL,
    [DT_LEVEL_]         AS            (case when [DT_LEVEL] IS NULL then 'отсутствует' when [DT_LEVEL]=(7) then 'сутки' when [DT_LEVEL]=(6) then 'неделя' when [DT_LEVEL]=(5) then 'декада' when [DT_LEVEL]=(4) then 'месяц' when [DT_LEVEL]=(3) then 'квартал' when [DT_LEVEL]=(2) then 'полугодие' when [DT_LEVEL]=(1) then 'год' else 'не определен: '+ltrim(rtrim(str([DT_LEVEL]))) end),
    [WEEK_NUMBER]       INT           NULL,
    CONSTRAINT [PK_Calendars] PRIMARY KEY CLUSTERED ([CalendarID] ASC)
);


GO

