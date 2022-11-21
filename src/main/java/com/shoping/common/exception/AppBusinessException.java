package com.shoping.common.exception;

/**
 * app业务异常
 *
 * @author ruoyi
 */
public class AppBusinessException extends RuntimeException
{
    private static final long serialVersionUID = 1L;

    protected final String message;

    public AppBusinessException(String message)
    {
        this.message = message;
    }

    public AppBusinessException(String message, Throwable e)
    {
        super(message, e);
        this.message = message;
    }

    @Override
    public String getMessage()
    {
        return message;
    }
}
